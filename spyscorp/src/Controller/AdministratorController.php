<?php

namespace App\Controller;

use App\Entity\Administrator;
use App\Form\AdministratorType;
use App\Repository\AdministratorRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/administrator')]
class AdministratorController extends AbstractController
{
    #[Route('/', name: 'administrator_index', methods: ['GET'])]
    public function index(AdministratorRepository $administratorRepository): Response
    {
        return $this->render('administrator/index.html.twig', [
            'administrators' => $administratorRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'administrator_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $administrator = new Administrator();
        $form = $this->createForm(AdministratorType::class, $administrator);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($administrator);
            $entityManager->flush();

            return $this->redirectToRoute('administrator_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('administrator/new.html.twig', [
            'administrator' => $administrator,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'administrator_show', methods: ['GET'])]
    public function show(Administrator $administrator): Response
    {
        return $this->render('administrator/show.html.twig', [
            'administrator' => $administrator,
        ]);
    }

    #[Route('/{id}/edit', name: 'administrator_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Administrator $administrator, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(AdministratorType::class, $administrator);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('administrator_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('administrator/edit.html.twig', [
            'administrator' => $administrator,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'administrator_delete', methods: ['POST'])]
    public function delete(Request $request, Administrator $administrator, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$administrator->getId(), $request->request->get('_token'))) {
            $entityManager->remove($administrator);
            $entityManager->flush();
        }

        return $this->redirectToRoute('administrator_index', [], Response::HTTP_SEE_OTHER);
    }
}
