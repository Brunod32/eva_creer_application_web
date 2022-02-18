<?php

namespace App\Repository;

use App\Entity\Hideout;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Hideout|null find($id, $lockMode = null, $lockVersion = null)
 * @method Hideout|null findOneBy(array $criteria, array $orderBy = null)
 * @method Hideout[]    findAll()
 * @method Hideout[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class HideoutRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Hideout::class);
    }

    // Pagination
    public function findHideoutPaginer(int $page = 1, int $limit = 5): array
    {
        return $this->findBy([], [], $limit, ($page - 1) * 5);

    }

    public function findHideoutPaginerCount(): int
    {
        $mission = $this->findAll();
        return $this->count([]);
    }

    // /**
    //  * @return Hideout[] Returns an array of Hideout objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('h')
            ->andWhere('h.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('h.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Hideout
    {
        return $this->createQueryBuilder('h')
            ->andWhere('h.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
